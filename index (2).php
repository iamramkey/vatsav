<?php
// Kickstart the framework
$f3=require('lib/base.php');
$f3->set('DEBUG',1);
if ((float)PCRE_VERSION<7.9){
    trigger_error('PCRE version is out of date');   
}
date_default_timezone_set('Asia/Calcutta');
function db(){
    /*return new DB\SQL(
        'mysql:host=localhost;port=3306;dbname=vatsav',
        'root',
        ''
    );*/
    return new DB\SQL(
        'mysql:host=mysql.hostinger.in;port=3306;dbname=u713348992_db',
        'u713348992_user',
        'dbP@55w0rd'
    );
}

$f3->route('GET /',function($f3){
    echo 'hi';
});

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

$f3->route('POST /createChat',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = clean($f3,'POST.username');
        $response = [];
        if(empty($username)){
            $response['status'] = 412;
            $response['message'] = 'Invalid username provided';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ?',$username));
        if(empty($user)){
            $response['status'] = 412;
            $response['message'] = 'Username doesnt exists';
            echo json_encode($response);
            return;
        }
        $to = clean($f3,'POST.to_user');
        if(empty($to)){
            $response['status'] = 412;
            $response['message'] = 'Empty to username provided';
            echo json_encode($response);
            return;
        }
        $toUser = $users->findone(array('user_name = ?',$to));
        if(empty($toUser)){
            $response['status'] = 412;
            $response['message'] = 'To username doesnt exists';
            echo json_encode($response);
            return;
        }
        $message = clean($f3,'POST.message');
        if(empty($message)){
            $response['status'] = 412;
            $response['message'] = 'No Message recieved';
            echo json_encode($response);
            return;
        }
        $chat = new DB\SQL\Mapper($db,'chat');
        $chat->from_user = $user->user_name;
        $chat->to_user = $toUser->user_name;
        $chat->message = $message;
        $chat->status = 'recieved';
        $chat->save();
        $response['status'] = 200;
        $response['message'] = 'Successfully sent to server';
        echo json_encode($response);
        return;
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }    
});

$f3->route('GET /recieve',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = clean($f3,'GET.username');
        $response = [];
        if(empty($username)){
            $response['status'] = 412;
            $response['message'] = 'Invalid parameters provided';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ?',$username));
        if(empty($user)){
            $response['status'] = 412;
            $response['message'] = 'Username doesnt exists';
            echo json_encode($response);
            return;
        }
        $chats = new DB\SQL\Mapper($db,'chat');
        $chat = $chats->find(["to_user = ? and status = 'recieved'",$username]);
        $messages = [];
        for($i = 0 ; $i < count($chat);$i++){
            $from = $users->findone(['user_name = ?',$chat[$i]['from_user']]);
            if(!empty($from)){
                $fromData = $from->cast();
                unset($fromData['password']);
                $messages[] = [
                    'from' => $fromData,
                    'id' => $chat[$i]->id,
                    'message' => $chat[$i]->message,
                    'seen' => $chat[$i]->seen
                ];
                $chat[$i]->status = 'sent';
                $chat[$i]->seen = date("Y-m-d H:i:s");
                $chat[$i]->save();
            }
        }
        $response['status'] = 200;
        $response['message'] = 'Successfully recieved messages';
        $response['chats'] = $messages;
        echo json_encode($response);
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('POST /seen',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = clean($f3,'GET.user');
        $chatIds = clean($f3,'GET.chats');
        $response = [];
        if(empty($username) || count($chatIds) == 0){
            $response['status'] = 412;
            $response['message'] = 'Invalid parameters provided';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ?',$username));
        if(empty($user)){
            $response['status'] = 412;
            $response['message'] = 'Username doesnt exists';
            echo json_encode($response);
            return;
        }
        $updated = [];
        $chats = new DB\SQL\Mapper($db,'chat');
        for($i = 0; $i < count($chatIds) ; $i++){
            $each = $chats->findone(["to_user = ? and id = ?",$user->user_name,$chatIds[$i]]);
            if(!empty($each)){
                if($each->status == 'recieved'){
                    $each->status = 'viewed';
                    $each->seen = date("Y-m-d H:i:s");
                    $each->save();
                    $updated[] = $each->cast();   
                }
            }
        }
        if(count($updated) > 0){
            $response['status'] = 200;
            $response['message'] = 'Successfully updated messages';
            $response['updatedRows'] = $updated;
            echo json_encode($response);
        }else{
            $response['status'] = 201;
            $response['message'] = 'No chats are updated';
            echo json_encode($response);
        }
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('GET /chats',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $users = $db->exec('select * from chat');
        $response = [];
        $response['status'] = 200;
        $response['message'] = 'Successfully retreived chats list';
        $response['data'] = $users;
        echo json_encode($response);
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('GET /chats/@user',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = $f3->get('PARAMS.user');
        if(empty($username)){
            $response['status'] = 412;
            $response['message'] = 'Invalid user details';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ?',$username));
        if(empty($user)){
            $response['status'] = 412;
            $response['message'] = 'Username doesnt exists';
            echo json_encode($response);
            return;
        }
        $chats = $db->exec("SELECT * FROM `chat` where from_user = '$user->user_name' or to_user = '$user->user_name'  order by from_user");
        $response['status'] = 200;
        $response['message'] = 'Successfully retrieved messages';
        $response['data'] = $chats;
        echo json_encode($response);
        return;
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

function unique_id( $l ){
    return substr( md5( uniqid( mt_rand(), true ) ), 0, $l );
}

function getUniqueUsername($username){
    $db = db();
    $users = new DB\SQL\Mapper($db,'users');
    $user = $users->findone(array('user_name = ?',$username));
    if ( !empty($user) ) {
        $username = $username . rand( 0, 1000000000000 );
        return getUniqueUsername($username);
    } else {
        return $username;
    }
}

function generateUserName( $name ){
    $username = strtolower( $name );
    $username = preg_replace( "/[^A-Za-z0-9_.]/", "", $username );    
    return getUniqueUsername($username);
}

function clean($f3, $value){
    return $f3->clean($f3->get($value));
}

$f3->route('GET /universities',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $limit = clean($f3, 'GET.limit');
        if(!is_numeric($limit)){
            $limit  = '';
        }else{
            if($limit <= 0){
                $limit = '';
            }else{
                $limit = ' limit ' . $limit;   
            }
        }
        $db = db();
        $users = $db->exec('select * from universities' . $limit);
        $response = [];
        $response['status'] = 200;
        $response['message'] = 'Successfully retreived universisites list';
        $response['data'] = $users;
        echo json_encode($response);
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('POST /register',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $email = clean($f3, 'POST.email');
        $response = [];
        if(empty($email)){
            $response['status'] = 412;
            $response['message'] = 'Invalid email id provided';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ? or email = ?',$email, $email));
        if(!empty($user)){
            $response['status'] = 409;
            $response['message'] = 'Email already exists';
            echo json_encode($response);
            return;
        }
        $password = clean($f3, 'POST.password');
        $first = clean($f3,'POST.firstname');
        $last = clean($f3,'POST.lastname');
        $phone = clean($f3,'POST.phone');
        $gender = clean($f3,'POST.gender');
        if(empty($password) || empty($first) || empty($last) || empty($phone) || empty($gender)){
            $response['status'] = 412;
            $response['message'] = 'Invalid user details';
            echo json_encode($response);
            return;        
        }
        $latitude = clean($f3,'POST.latitude');
        $longitude = clean($f3,'POST.longitude');
        $locationText = clean($f3,'POST.location');
        if(!empty($latitude) && !empty($longitude) && !empty($locationText)){
            if(!is_numeric($latitude) || !is_numeric($longitude)){
                $response['status'] = 412;
                $response['message'] = 'Latitude or Longitude is not numeric';
                echo json_encode($response);
                return;        
            }   
        }
        $passout = clean($f3,'POST.passout');
        $course = clean($f3,'POST.course');
        $university = clean($f3,'POST.university');
        if(empty($passout) || empty($course) || empty($university)){
            $response['status'] = 412;
            $response['message'] = 'Invalid educational details';
            echo json_encode($response);
            return;   
        }
        $area = clean($f3,'POST.area');
        $company = clean($f3,'POST.company');
        $designation = clean($f3,'POST.designation');
        if(empty($area) || empty($company) || empty($designation)){
            $response['status'] = 412;
            $response['message'] = 'Invalid work details';
            echo json_encode($response);
            return;   
        }
        $user = new DB\SQL\Mapper($db,'users');
        $username = generateUserName($first . ' ' . $last);
        $user->user_name = $username;
        $user->password = $password;
        $user->email = $email;
        $user->first_name = $first;
        $user->last_name = $last;
        $user->phone = $phone;
        $user->gender = $gender;
        $user->save();
        if(!empty($latitude) && !empty($longitude) && !empty($locationText)){
            $location = new DB\SQL\Mapper($db,'location');
            $location->user_name = $username;
            $location->latitude = $latitude;
            $location->longitude = $longitude;
            $location->location = $locationText;
            $location->save();
        }
        $education = new DB\SQL\Mapper($db,'education');
        $education->username = $username;
        $education->passout = $passout;
        $education->course = $course;
        $education->university = $university;
        $education->save();
        $work = new DB\SQL\Mapper($db,'work');
        $work->user_name = $username;
        $work->area = $area;
        $work->company = $company;
        $work->designation = $designation;
        $work->save();
        $response['status'] = 200;
        $response['message'] = 'Successfully registered user';
        $response['data'] = $user->cast();
        unset($response['data']['password']);
        echo json_encode($response);
        return;
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('POST /updateProfile',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = clean($f3, 'POST.username');
        $response = [];
        if(empty($username)){
            $response['status'] = 412;
            $response['message'] = 'Invalid username/email id provided';
            echo json_encode($response);
            return;
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ? or email = ?',$username, $username));
        if(empty($user)){
            $response['status'] = 404;
            $response['message'] = 'Email is not registered';
            echo json_encode($response);
            return;
        }
        $first = clean($f3,'POST.firstname');
        $last = clean($f3,'POST.lastname');
        $phone = clean($f3,'POST.phone');
        $gender = clean($f3,'POST.gender');
        if(empty($first) || empty($last) || empty($phone) || empty($gender)){
            $response['status'] = 412;
            $response['message'] = 'Invalid user details';
            echo json_encode($response);
            return;        
        }
        $locationText = clean($f3,'POST.location');
        if(empty($locationText)){
            $response['status'] = 412;
            $response['message'] = 'Location is empty';
            echo json_encode($response);
            return;
        }
        $passout = clean($f3,'POST.passout');
        $course = clean($f3,'POST.course');
        $university = clean($f3,'POST.university');
        if(empty($passout) || empty($course) || empty($university)){
            $response['status'] = 412;
            $response['message'] = 'Invalid educational details';
            echo json_encode($response);
            return;   
        }
        $area = clean($f3,'POST.area');
        $company = clean($f3,'POST.company');
        $designation = clean($f3,'POST.designation');
        if(empty($area) || empty($company) || empty($designation)){
            $response['status'] = 412;
            $response['message'] = 'Invalid work details';
            echo json_encode($response);
            return;   
        }
        //SELECT * FROM `location` WHERE user_name = 'rama' and location_id in (select MAX(`location_id`) from location)
        $user->first_name = $first;
        $user->last_name = $last;
        $user->phone = $phone;
        $user->gender = $gender;
        $user->save();
        $locations = new DB\SQL\Mapper($db,'location');
        $location = $locations->findone(['user_name = ?',$user->user_name],['order' => 'location_id DESC']);
        if(!empty($location)){
            $location->location = $locationText;
            $location->save();   
        }
        $educations = new DB\SQL\Mapper($db,'education');
        $education = $educations->findone(['username = ?',$user->user_name]);
        if(!empty($education)){
            $education->passout = $passout;
            $education->course = $course;
            $education->university = $university;
            $education->save();   
        }
        $works = new DB\SQL\Mapper($db,'work');
        $work = $works->findone(['user_name = ?',$user->user_name]);
        if(!empty($work)){
            $work->area = $area;
            $work->company = $company;
            $work->designation = $designation;
            $work->save();   
        }      
        $response['status'] = 200;
        $response['message'] = 'Successfully updated user information';
        $response['data'] = $user->cast();
        unset($response['data']['password']);
        echo json_encode($response);
        return;
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('POST /updateLocation',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        $username = clean($f3, 'POST.username');
        $latitude = clean($f3, 'POST.latitude');
        $longitude = clean($f3, 'POST.longitude');
        $locationText = clean($f3, 'POST.location');
        $response = [];
        if(empty($username) || empty($latitude) || empty($longitude) || empty($locationText)){
            $response['status'] = 412;
            $response['message'] = 'Invalid user details';
            echo json_encode($response);
            return;
        }
        if(!is_numeric($latitude) || !is_numeric($longitude)){
            $response['status'] = 412;
            $response['message'] = 'Latitude or Longitude is not numeric';
            echo json_encode($response);
            return;        
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ? or email = ?',$username, $username));
        if(empty($user)){
            $response['status'] = 404;
            $response['message'] = 'Email is not registered';
            echo json_encode($response);
            return;
        }else{
            $locations = new DB\SQL\Mapper($db,'location');
            $location = $locations->findone(array('user_name = ? and latitude = ? and longitude = ?',$username, $latitude, $longitude));
            if(empty($location)){
                $location = new DB\SQL\Mapper($db,'location');
                $location->user_name = $user->user_name;
                $location->latitude = $latitude;
                $location->longitude = $longitude;
                $location->location = $locationText;
                $location->save();
            }
            $user->online_status = date('Y-m-d H:i:s');
            $user->last_active = date('Y-m-d H:i:s');
            $user->save();
            $response['status'] = 200;
            $response['message'] = 'Successfully updated user location';
            $response['data'] = $user->cast();
            unset($response['data']['password']);
            echo json_encode($response);
            return;
        }  
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

$f3->route('POST /login',function($f3){
    $elog = new Log( 'logs/' . date('Y-m-d') . '_err.log');
    $ilog = new Log( 'logs/' . date('Y-m-d') . '_info.log');
    try{
        //$name = 'Rama';
        //var_dump(generateUserName($name));
        //$ilog->write( 'Sample logging' );
        $username = clean($f3, 'POST.username');
        $password = clean($f3, 'POST.password');
        $latitude = clean($f3, 'POST.latitude');
        $longitude = clean($f3, 'POST.longitude');
        $locationText = clean($f3, 'POST.location');
        $response = [];
        if(empty($username) || empty($password)){
            $response['status'] = 412;
            $response['message'] = 'Invalid user details';
            echo json_encode($response);
            return;
        }
        if(!empty($latitude) && !empty($longitude) && !empty($locationText)){
            if(!is_numeric($latitude) || !is_numeric($longitude)){
                $response['status'] = 412;
                $response['message'] = 'Latitude or Longitude is not numeric';
                echo json_encode($response);
                return;        
            }   
        }
        $db = db();
        $users = new DB\SQL\Mapper($db,'users');
        $user = $users->findone(array('user_name = ? or email = ?',$username, $username));
        if(empty($user)){
            $response['status'] = 404;
            $response['message'] = 'Email is not registered';
            echo json_encode($response);
            return;
        }else if($user->password == $password){
            if(!empty($latitude) && !empty($longitude) && !empty($locationText)){
                $locations = new DB\SQL\Mapper($db,'location');
                $location = $locations->findone(array('user_name = ? and latitude = ? and longitude = ?',$username, $latitude, $longitude));
                if(empty($location)){
                    $location = new DB\SQL\Mapper($db,'location');
                    $location->user_name = $user->user_name;
                    $location->latitude = $latitude;
                    $location->longitude = $longitude;
                    $location->location = $locationText;
                    $location->save();
                }
            }
            $user->online_status = date('Y-m-d H:i:s');
            $user->last_active = date('Y-m-d H:i:s');
            $user->save();
            $response['status'] = 200;
            $response['message'] = 'Successfully logged in user';
            $response['data'] = $user->cast();
            $locations = new DB\SQL\Mapper($db,'location');
            $location = $locations->findone(['user_name = ?',$user->user_name],['order' => 'location_id DESC']);
            if(!empty($location)){
                $response['data']['location'] = $location->cast();
            }
            $educations = new DB\SQL\Mapper($db,'education');
            $education = $educations->findone(['username = ?',$user->user_name]);
            if(!empty($education)){ 
                $response['data']['education'] = $education->cast();
            }
            $works = new DB\SQL\Mapper($db,'work');
            $work = $works->findone(['user_name = ?',$user->user_name]);
            if(!empty($work)){ 
                $response['data']['work'] = $work->cast();
            }
            unset($response['data']['password']);
            echo json_encode($response);
            return;
        }else{
            $response['status'] = 401;
            $response['message'] = 'Invalid credentials';
            echo json_encode($response);
            return;
        }
    }catch(Exception $e){
        $elog->write($e->getMessage());
        $elog->write($e->getTraceAsString());
        $response['status'] = 500;
        $response['message'] = 'Internal server error';
        echo json_encode($response);
        return;
    }
});

	//http://localhost/vatsav/chats
	//http://localhost/vatsav/seen?user=rama1&chats[]=1&chats[]=2
	//http://localhost/vatsav/recieve?user=rama1
	//http://localhost/vatsav/gen
//user_id, user_name, password, email, first_name, last_name, gender, online, phone, last_active
//educational details : user_name,passout_year,course,university
//work_details : work_area, company, designation
//location details : latitude, longitude, location(text)
//friends : friend_1, friend_2, status, times
//activity_log : user, service, time, 
// online friends
$f3->run();