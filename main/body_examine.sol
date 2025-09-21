pragma solidity ^0.8.24;
 
 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Body_Examine is ERC721Enumerable {
    // Mappings
    mapping(uint256 => Tests)    private patientTests;
    mapping(uint256 => Scan)     private scanTests;
    mapping(uint256 => SystemEx) private systemExams;
    mapping(uint256 => Prev)     private prevDates;
    mapping(uint256 => Patient)  private patientList;

    // Structs (types start with capital)
    struct Patient {
        uint256 patient_id;
    }

    struct Prev {
        uint256 patient_id;
        string previous;
    }

    struct Tests {
        uint256 patient_id;
        string blood_test;
        string urine_test;
        string ecg;
        string mri_scan;
        string ct_scan;
        string xray;
        string lab_test;
    }

    struct Scan {
        uint256 patient_id;
        string built;
        string nouirishment;
        string eyes;
        string tongue;
        uint64 pulse;
        uint64 temp;
        string blood_pressure;
        uint64 respiratory_rate;
    }

    struct SystemEx {
        uint256 patient_id;
        string cns;
        string cvs;
        string rs;
        string abdomen;
    }

    address public owner;

    constructor() ERC721("MedicalCoin", "MEDC") public {
        owner = 0x34d8bC94989BbE14BCfd98E0550201ba4970B776; // Address of Doctor
    }

    // modifier to give access only to doctor
    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");
        _;
    }

    // Token details helpers
    function namedecl() public view returns (string memory) {
        return name();
    }

    function symboldecl() public view returns (string memory) {
        return symbol();
    }

    function totalSupplycount() public view returns (uint256) {
        return totalSupply(); // available because we inherit ERC721Enumerable
    }

    function medical_record(uint256 patient_id) public {
        _mint(msg.sender, patient_id);

        Patient memory newP = Patient({ patient_id: patient_id });
        patientList[patient_id] = newP;
    }

    function previous_dates(uint256 patient_id, string memory _previous) public isOwner {
        Prev memory newPr = Prev({
            patient_id: patient_id,
            previous: _previous
        });
        prevDates[patient_id] = newPr;
    }

    function get_previous_dates(uint256 patient_id) public view returns (string memory) {
        Prev memory pr = prevDates[patient_id];
        return pr.previous;
    }

    function investigations(
        uint256 patient_id,
        string memory _blood_test,
        string memory _urine_test,
        string memory _ecg,
        string memory _mri_scan,
        string memory _ct_scan,
        string memory _xray,
        string memory _lab_test
    ) public isOwner {
        Tests memory newT = Tests({
            patient_id: patient_id,
            blood_test: _blood_test,
            urine_test: _urine_test,
            ecg: _ecg,
            mri_scan: _mri_scan,
            ct_scan: _ct_scan,
            xray: _xray,
            lab_test: _lab_test
        });
        patientTests[patient_id] = newT;
    }

    function get_investigations(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        Tests memory t = patientTests[patient_id];
        return (t.blood_test, t.urine_test, t.ecg, t.mri_scan, t.ct_scan, t.xray, t.lab_test);
    }

    function general_examin(
        uint256 patient_id,
        string memory _built,
        string memory _nouirishment,
        string memory _eyes,
        string memory _tongue,
        uint64 _pulse,
        string memory _blood_pressure,
        uint64 _temp,
        uint64 _respiratory_rate
    ) public isOwner {
        Scan memory newS = Scan({
            patient_id: patient_id,
            built: _built,
            nouirishment: _nouirishment,
            eyes: _eyes,
            tongue: _tongue,
            pulse: _pulse,
            temp: _temp,
            blood_pressure: _blood_pressure,
            respiratory_rate: _respiratory_rate
        });
        scanTests[patient_id] = newS;
    }

    function get_general_examin(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint64,
            string memory,
            uint64,
            uint64
        )
    {
        Scan memory s = scanTests[patient_id];
        return (s.built, s.nouirishment, s.eyes, s.tongue, s.pulse, s.blood_pressure, s.temp, s.respiratory_rate);
    }

    function sys_examin(
        uint256 patient_id,
        string memory _cvs,
        string memory _cns,
        string memory _rs,
        string memory _abdomen
    ) public isOwner {
        SystemEx memory newSys = SystemEx({
            patient_id: patient_id,
            cns: _cns,
            cvs: _cvs,
            rs: _rs,
            abdomen: _abdomen
        });
        systemExams[patient_id] = newSys;
    }

    function get_sys_examin(uint256 patient_id) public view returns (string memory, string memory, string memory, string memory) {
        SystemEx memory sys = systemExams[patient_id];
        return (sys.cns, sys.cvs, sys.rs, sys.abdomen);
    }
}
