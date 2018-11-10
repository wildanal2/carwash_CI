<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class UserTransaksi extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan data Kendaraan     
    function index_post() {
        $this->db->select('*');
        $this->db->from('transaksi');
        $this->db->where('kasir',$this->input->post('kasir'));
        $this->db->order_by('tanggal', 'desc');
        $query=$this->db->get()->result();
         return $this->response(array('suksess' => 'okee','result'=>$query));
    } 
    //Masukan function selanjutnya disini 
} ?>