<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Event extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan data event     
    function eventuser_get() {         
        $this->db->select('*');
        $this->db->from('event');
        $this->db->where('status', "Aktif");
        $query=$this->db->get()->result();
        $this->response(array("status"=>200, "result"=>$query));   
    } 


    //Menampilkan data event     
    function index_get() {         
        $event = $this->db->get('event')->result();
        $this->response(array("result"=>$event, 200));   
    } 


    //Mengirim atau menambah data Event baru  
    function newEvent_post() {         
        $data = array(
            'nama_event'   => $this->post('nama_event'),                     
            'img'   => $this->post('img'),
            'detail' => $this->post('detail'),
            'diskon' => $this->post('diskon'),
            'required' => $this->post('required'),
            'bulan' => $this->post('bulan'),
            'status' => $this->post('status')
        ); 

        $insert = $this->db->insert('event', $data);         
        if ($insert) {             
            $this->response(array('status' =>200, 'result' =>$data));         
        } else {             
            $this->response(array('status' => 'fail', 502));         
        }    
    } 


    //Mencheck event 
    function checkevent_post() {         
    	$nopol = $this->post('nopol');
        $bln = $this->post('bln');
        $query = $this->db->query("SELECT count(*) as jumlah FROM transaksi where nopol='$nopol' and MONTH(tanggal) =$bln");  
        $row = $query->row();
        $str = $row->jumlah;
        return $this->response(array('status' => 200,'jumlah'=>$str));
    } 

    //Memperbarui Status Event  
    function gantiStatusEvent_put() {         
        $id = $this->put('id');         
        $data = array(
            'status'          => $this->put('status')
        );         
   
        $this->db->where('id', $id);         
        $update = $this->db->update('event', $data);

        if ($update) {             
            $this->response(array('status'=>200 ,'result' => $data));         
        } else {             
            $this->response(array('status' => 'fail', 502));         
        }     
    } 
  
 	//Menghapus salah satu data kontak  
 	function index_delete() {         
 		
 		$id = $this->delete('id');         
 		$this->db->where('id', $id);         
 		$delete = $this->db->delete('event');  

 		if ($delete) {             
 			$this->response(array('status' => 'success'), 201);         
 		} else {             
 			$this->response(array('status' => 'fail', 502));         
 		}    
 	} 


    //Masukan function selanjutnya disini 
} ?>