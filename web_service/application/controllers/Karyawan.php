<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Karyawan extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan data Kendaraan     
    function index_get() {         
        $this->db->where('level',"1");
        $users = $this->db->get('users')->result();
        $this->response(array("result"=>$users, 200));   
    } 

    //Mengirim atau menambah data Kendarraan baru  
    function index_post() {         
    	$data = array(
            'id'     => $this->post('id'), 
            'nama'   => $this->post('nama'),                     
            'nohp'   => $this->post('nohp'),
            'alamat' => $this->post('alamat'),
            'password' => $this->post('password'),
            'level' => $this->post('level')
        ); 

        $insert = $this->db->insert('users', $data);         
        if ($insert) {             
            $this->response($data, 200);         
        } else {             
            $this->response(array('status' => 'fail', 502));         
        }    
    } 

    //Memperbarui data kontak yang telah ada  
    function index_put() {         
    	$id = $this->put('id');         
    	$data = array(                     
    		'id'   => $this->put('id'),                     
    		'nama' => $this->put('nama'),                     
    		'nohp' => $this->put('nohp'),
            'alamat'=> $this->put('alamat'),
            'password' => $this->put('password'),
            'level' => $this->put('level')
    	);         
   
    	$this->db->where('id', $id);         
    	$update = $this->db->update('users', $data);         
    	if ($update) {             
    		$this->response($data, 200);         
    	} else {             
    		$this->response(array('status' => 'fail', 502));         
    	}     
    } 
 
 	//Menghapus salah satu data kontak  
 	function index_delete() {         
 		
 		$id = $this->delete('id');         
 		$this->db->where('id', $id);         
 		$delete = $this->db->delete('users');  

 		if ($delete) {             
 			$this->response(array('status' => 'success'), 201);         
 		} else {             
 			$this->response(array('status' => 'fail', 502));         
 		}    
 	} 
    //Masukan function selanjutnya disini 
} ?>