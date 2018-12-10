<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Transaksi extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
        date_default_timezone_set("Asia/Jakarta");
    } 
 
    //Menampilkan data Kendaraan     
    function index_get() {         
        $transaksi = $this->db->get('transaksi')->result();
        $this->response(array("result"=>$transaksi, 200));   
    } 

    //Mengirim atau menambah data Kendarraan baru  
    function index_post() {         
    	$data = array(
            'id'     => $this->post('id'), 
            'nopol'   => $this->post('nopol'),                     
            'kendaraan'   => $this->post('kendaraan'),
            'harga_kendaraan' => $this->post('harga_kendaraan'),
            'kondisi' => $this->post('kondisi'),
            'harga_kondisi'   => $this->post('harga_kondisi'),
            'total' => $this->post('total'),
            'kasir' => $this->post('kasir'),
            'tanggal' => date("Y-m-d H:i:s")
        ); 

        $insert = $this->db->insert('transaksi', $data);         
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
    	$update = $this->db->update('transaksi', $data);         
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
 		$delete = $this->db->delete('transaksi');  

 		if ($delete) {             
 			$this->response(array('status' => 'success'), 201);         
 		} else {             
 			$this->response(array('status' => 'fail', 502));         
 		}    
 	} 
    //Masukan function selanjutnya disini 
} ?>