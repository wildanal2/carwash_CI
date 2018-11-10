<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Kondisi extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan data kondisi     
    function index_get() {         
        $kondisi = $this->db->get('kondisi')->result();
        $this->response(array("result"=>$kondisi, 200));   
    } 

    //Mengirim atau menambah data kondisi baru  
    function index_post() {         
    	$data = array(
            'id'       => $this->post('id'), 
            'nama'          => $this->post('nama'),                     
            'harga'    => $this->post('harga'),
            'img'          => $this->post('img')
        ); 

        $insert = $this->db->insert('kondisi', $data);         
        if ($insert) {             
            $this->response($data, 200);         
        } else {             
            $this->response(array('status' => 'fail', 502));         
        }    
    } 

    //Memperbarui data kondisi yang telah ada  
    function index_put() {         
    	$id = $this->put('id');         
    	$data = array(                     
    		'id'       => $this->put('id'),                     
    		'nama'          => $this->put('nama'),                     
    		'harga'    => $this->put('harga'),
            'img'          => $this->put('img')
    	);         
   
    	$this->db->where('id', $id);         
    	$update = $this->db->update('kondisi', $data);         
    	if ($update) {             
    		$this->response($data, 200);         
    	} else {             
    		$this->response(array('status' => 'fail', 502));         
    	}     
    } 
 
 	//Menghapus salah satu data kondisi  
 	function index_delete() {         
 		
 		$id = $this->delete('id');         
 		$this->db->where('id', $id);         
 		$delete = $this->db->delete('kondisi');  

 		if ($delete) {             
 			$this->response(array('status' => 'success'), 201);         
 		} else {             
 			$this->response(array('status' => 'fail', 502));         
 		}    
 	} 
    //Masukan function selanjutnya disini 
} ?>