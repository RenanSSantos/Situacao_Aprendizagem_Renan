<?php
Class User extends CI_Model
{
 function login($nome, $senha)
 {
   $this -> db -> select('idusuario, nome, senha');
   $this -> db -> from('usuario');
   $this -> db -> where('nome', $nome);
   $this -> db -> where('senha',$senha);
   $this -> db -> limit(1);

   $query = $this -> db -> get();

   if($query -> num_rows() == 1)
   {
     return $query->result();
   }
   else
   {
     return false;
   }
 }
}
?>