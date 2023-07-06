<?php


namespace App\Exceptions;


use App\Traits\ResponseFormat;
use Throwable;

class GateWayException extends \Exception
{
    use ResponseFormat;
    protected $code=501;
    public function __construct($message = "", $code = 0, Throwable $previous = null) {
        parent::__construct($message,$code,$previous);
    }
    public function render(){
       return $this->fail($this->code,$this->message);
    }

}
