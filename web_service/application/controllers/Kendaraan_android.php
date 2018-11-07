<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Kendaraan_android extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
       //Menampilkan data kendaraan
    function index_get() { 
        $kendaraan = $this->db->get('kendaraan')->result();
        $this->response(array("result"=>$kendaraan, 200));
    }

} ?>