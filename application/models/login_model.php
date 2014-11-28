<?php

class Login_model extends CI_Model {

    # VALIDA USUÁRIO
    function validar() {
        $this->db->where('email', $this->input->post('email')); 
        //$this->db->where('senha', md5($this->input->post('senha')));
        
        //TODO: Ativar o MD5
        $this->db->where('senha', $this->input->post('senha'));
        

        $query = $this->db->get('usuario'); 

        if ($query->num_rows == 1) { 
            return true; // RETORNA VERDADEIRO
        }
    }

    # VERIFICA SE O USUÁRIO ESTÁ LOGADO
    function logado() {
        $logado = $this->session->userdata('logado');

        if (!isset($logado) || $logado != true) {
            return false; //Deu mó ruim
        }
        else{
            return true;//Deu bom
        }
    }
}


