<?php
include 'config.php';
class clscat
{
    public $catcod,$catnam;
    public function save_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call inscat('$this->catnam')";
        $res=mysqli_query($link,$qry) or die(mysqli_error($link));
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function update_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call updcat($this->catcod,'$this->catnam')";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
        
    }
    public function delete_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call delcat($this->catcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return false;
        }
    }
    public function disp_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call dspcat()";
        $res=mysqli_query($link,$qry);
        $i=0;
        $ar= array();
        while($r=mysqli_fetch_row($res))
        {
            $ar[$i]=$r;
            $i++;
        }
        $con->db_close();
        return $ar;
    }
    public function find_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call fndcat($this->catcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_num_rows($res)>0)
        {
            $r=mysqli_fetch_row($res);
            $this->catcod=$r[0];
            $this->catnam=$r[1];
            
        }
    }
}
####################################################
class clsprd
{
    public $prdcod,$prdnam,$prddsc,$prdpic,$prdprc,$prdoff,$prdcatcod,$prdisavl;
    public function save_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call insprd('$this->prdnam','$this->prddsc','$this->prdpic',$this->prdprc,'$this->prdoff',$this->prdcatcod,'$this->prdisavl')";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
     public function update_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call updprd($this->prdcod,'$this->prdnam','$this->prddsc','$this->prdpic',$this->prdprc,'$this->prdoff',$this->prdcatcod,'$this->prdisavl')";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function delete_rec()
    {
         $con=new clscon();
        $link=$con->db_connect();
        $qry="call delprd($this->prdcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function disp_rec($ccod)
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call dspprd($ccod)";
        $res=mysqli_query($link,$qry);
        $i=0;
        $ar= array();
        while($r=mysqli_fetch_row($res))
        {
            $ar[$i]=$r;
            $i++;
        }
        $con->db_close();
        return $ar;
    }
    public function find_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call fndprd($this->prdcod)";
        $res=mysqli_query($link,$qry) or die(mysqli_error($link));
        if(mysqli_num_rows($res)>0)
        {//'$this->prdnam','$this->prddsc','$this->prdpic',$this->prdprc,'$this->prdoff',$this->prdcatcod,'$this->prdisavl'
            $r=mysqli_fetch_row($res);
            $this->prdcod=$r[0];
            $this->prdnam=$r[1];
            $this->prddsc=$r[2];
            $this->prdpic=$r[3];
             $this->prdprc=$r[4];
              $this->prdoff=$r[5];
               $this->prdcatcod=$r[6];
                $this->prdisavl=$r[7];
                
        }
    }
}
####################################################
class clsusr
{
    public $usrcod,$usreml,$usrpwd,$usrregdat,$usrrol;
    
    public function login($eml,$pwd)
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call logincheck('$eml','$pwd',@cod,@rol)";
        $res= mysqli_query($link, $qry);
        $res1= mysqli_query($link,"select @cod,@rol");
        $r= mysqli_fetch_array($res1);
        if($r[0]==-1||$r[0]==-2)
            return FALSE;
        else
        {
            $_SESSION["cod"]=$r[0];
        $_SESSION["rol"]=$r[1];
        return TRUE;
    }
    }

        public function save_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call insusr1('$this->usreml','$this->usrpwd','$this->usrregdat','$this->usrrol',@cod)";
        $res=mysqli_query($link,$qry);
        $res1=  mysqli_query($link,"select @cod") ;
        $r=  mysqli_fetch_row($res1);
        {
            $con->db_close();
            return $r[0];
    }
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    
    public function logincheck($eml,$pwd)
    {
            $con=new clscon();
             $link=$con->db_connect();
            $qry="call logincheck('$eml','$pwd',@cod,@rol)";
            $res=mysqli_query($link,$qry);
            $res1=mysqli_query($link,"select @cod,@rol");
            $r=  mysqli_fetch_row($res1);
            $con->db_close();
            if($r[0]==-1 || $r[0]==-2)
                return FALSE;
            else
            {
                $_SESSION["ucod"]=$r[0];
                $_SESSION["rol"]=$r[1];
                return TRUE;
            }
    }
    public function update_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call updusr($this->usrcod,'$this->usreml','$this->usrpwd','$this->usrregdat','$this->usrrol')";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function delete_rec()
    {
         $con=new clscon();
        $link=$con->db_connect();
        $qry="call delusr($this->usrcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function disp_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call dspusr()";
        $res=mysqli_query($link,$qry)or die(mysqli_error($link));
        $i=0;
        $ar= array();
        while($r=mysqli_fetch_row($res))
        {
            $ar[$i]=$r;
            $i++;
        }
        $con->db_close();
        return $ar;
    }
    public function find_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call fndusr($this->usrcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_num_rows($res)>0)
        {
            $r=mysqli_fetch_row($res);
            $this->usrcod=$r[0];
            $this->usreml=$r[1];
            $this->usrpwd=$r[2];
            $this->usrregdat=$r[3];
            $this->usrrol=$r[4];
        }
    }
}
####################################################
class clsord
{
    public $ordcod,$orddat,$ordusrcod,$orddeladd,$orddelphn;
    public function save_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call insord('$this->orddat',$this->ordusrcod,'$this->orddeladd','$this->orddelphn',@cod)";
       // echo $qry;
        $res=mysqli_query($link,$qry) or die(mysqli_error($link));
        $res1=  mysqli_query($link,"select @cod");
        $r=  mysqli_fetch_row($res1);
       $con->db_close();
        return $r[0];
    }
    public function update_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call updord($this->ordcod,'$this->orddat',$this->ordusrcod,'$this->orddeladd','$this->orddelphn')";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function delete_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call delord($this->ordcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function disp_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call dspord()";
        $res=mysqli_query($link,$qry);
        $i=0;
        $ar = array();
        while($r=mysqli_fetch_row($res))
        {
            $ar[$i]=$r;
            $i++;
        }
        $con->db_close();
        return $ar;
    }
    public function find_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call fndord($this->ordcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_num_rows($res)>0)
        {
            $r=mysqli_fetch_row($res);
            $this->ordcod=$r[0];
            $this->orddat=$r[1];
            $this->ordusrcod=$r[2];
            $this->orddeladd=$r[3];
            $this->orddelphn=$r[4];
        }
    }
}
#####################################################
class clsorddet
{
    public $orddetcod,$orddetordcod,$orddetprdcod,$orddetprdqty;
    public function save_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call insorddet($this->orddetordcod,$this->orddetprdcod,$this->orddetprdqty)";
        $res=mysqli_query($link,$qry) or die(mysqli_error($link));
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function update_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call updord($this->orddetcod,$this->orddetordcod,$this->orddetprdcod,$this->orddetprdqty)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function delete_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call delord($this->orddetcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_affected_rows($link)==1)
        {
            $con->db_close();
            return TRUE;
        }
        else
        {
            $con->db_close();
            return FALSE;
        }
    }
    public function disp_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call dspord()";
        $res=mysqli_query($link,$qry);
        $i=0;
        $ar = array();
        while($r=mysqli_fetch_row($res))
        {
            $ar[$i]=$r;
            $i++;
        }
        $con->db_close();
        return $ar;
    }
    public function find_rec()
    {
        $con=new clscon();
        $link=$con->db_connect();
        $qry="call fndord($this->orddetcod)";
        $res=mysqli_query($link,$qry);
        if(mysqli_num_rows($res)>0)
        {
            $r=mysqli_fetch_row($res);
            $this->orddetcod=$r[0];
            $this->orddetordcod=$r[1];
            $this->orddetprdcod=$r[2];
            $this->orddetprdqty=$r[3];
          
        }
    }
  }
?>