<?php

class bookingClass {
    public $unit="";
    public $level = "";
    public $zone = "";
    public $project = "";
    public $queryUnit = array();
    public $owner_id = 0;
    public $unit_id = 0;
    private $mysql = FALSE;
    private $dbprefix = "";
    private $unitRecord = FALSE;

    function __construct($project, $zone, $level, $unit) {
        global $mysql, $dbprefix;
        $this->project = $project;
        $this->zone = $zone;
        $this->level = $level;
        $this->unit = $unit;

        $this->queryUnit = array(
            'prj_code' => $project,
            'zon_cod' => $zone,
            'lvl_cod' => $zone,
            'unt_cod' => $unit
        );
        $this->mysql = $mysql;
        $this->unitRecord = $this->mysql->getData($this->dbprefix."unit", $this->queryUnit);
        if ($this->unitRecord) {
            $this->unitRecord = (object) $this->unitRecord;
            $this->unit_id = $this->unitRecord->unit_id;
        }
    }

    function validOwner() {
        return ($this->unitRecord->owner_id == $this->owner_id ? TRUE : FALSE);
    }

    function booked() {
        $query = array('unit_id' => $this->unit_id, 'owner_id' => $this->owner_id);
        $result = $this->mysql->getData($this->dbprefix."takeover_booking", $query);
        return ($result ? TRUE : FALSE);
    }


}