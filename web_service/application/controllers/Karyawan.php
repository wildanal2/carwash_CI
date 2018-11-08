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
        $karyawan = $this->db->get('karyawan')->result();
        $this->response(array("result"=>$karyawan, 200));   
    } 

    //Mengirim atau menambah data Kendarraan baru  
    function index_post() {         
    	$data = array(
            'id'     => $this->post('id'), 
            'nama'   => $this->post('nama'),                     
            'nohp'   => $this->post('nohp'),
            'alamat' => $this->post('alamat'),
            'password' => $this->post('password')
        ); 

        $insert = $this->db->insert('karyawan', $data);         
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
            'password' => $this->put('password')
    	);         
   
    	$this->db->where('id', $id);         
    	$update = $this->db->update('karyawan', $data);         
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
 		$delete = $this->db->delete('karyawan');  

 		if ($delete) {             
 			$this->response(array('status' => 'success'), 201);         
 		} else {             
 			$this->response(array('status' => 'fail', 502));         
 		}    
 	} 
    //Masukan function selanjutnya disini 
} ?>