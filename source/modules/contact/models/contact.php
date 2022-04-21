<?php
/**
 * @author vangiangfly
 * @category Model
 */ 
class ContactModelsContact
{
    function save()
    {
        $email = FSInput::get('contact_email');
        $fullname = FSInput::get('contact_name');
        $address = FSInput::get('contact_address');
        $telephone = FSInput::get('contact_phone');
        $fax = FSInput::get('contact_fax');
        $subject = FSInput::get('contact_subject');
        $content = htmlspecialchars_decode(FSInput::get('message'));
        $time = date("Y-m-d H:i:s");
        $published = 0;
        $sql = "INSERT INTO 
                fs_contact (`email`,fullname,address,telephone,fax,subject,content,edited_time,created_time,published)
                VALUES ('$email','$fullname','$address','$telephone','$fax','$subject','$content','$time','$time','$published')";
        global $db;
        $db->query($sql);
        $id = $db->insert();
        return $id;
    }
}
?>