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
        $w = $this->post('where');
        $kasir = $this->post('kasir');

        if ($kasir=="") {
            if ($w=="today") {
                $query=$this->db->query("SELECT * FROM transaksi WHERE tanggal >= CURDATE() ORDER BY HOUR(tanggal) DESC, MINUTE(tanggal) DESC");
            }else if ($w=="week"){

                $query=$this->db->query("SELECT * FROM transaksi WHERE YEARWEEK(`tanggal`, 1) = YEARWEEK(CURDATE(), 1) order by tanggal DESC");
            }else if ($w=="month"){
                $query=$this->db->query("SELECT * FROM transaksi WHERE MONTH(tanggal) = MONTH(CURRENT_DATE()) AND YEAR(tanggal) = YEAR(CURRENT_DATE()) order by tanggal DESC");
            }

        }else{
            if ($w=="today") {
                $query=$this->db->query("SELECT * FROM transaksi WHERE tanggal >= CURDATE() AND kasir='$kasir' ORDER BY HOUR(tanggal) DESC, MINUTE(tanggal) DESC");
            }else if ($w=="week"){

                $query=$this->db->query("SELECT * FROM transaksi WHERE YEARWEEK(`tanggal`, 1) = YEARWEEK(CURDATE(), 1) AND kasir='$kasir' order by tanggal DESC");
            }else if ($w=="month"){
                $query=$this->db->query("SELECT * FROM transaksi WHERE MONTH(tanggal) = MONTH(CURRENT_DATE()) AND YEAR(tanggal) = YEAR(CURRENT_DATE()) AND kasir='$kasir' order by tanggal DESC");
            }
        }
        
        $query=$query->result();
         return $this->response(array('suksess' => 'okee','result'=>$query));
    } 


} ?>