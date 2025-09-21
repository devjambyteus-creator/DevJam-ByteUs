pragma solidity >=0.4.22 <0.7.0;
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
 
contract Body_Examine is ERC721 {
    mapping(uint256 => tests) patienttests;
    mapping(uint256 => scan) scantests;
    mapping(uint256 => system) systemexamine;
    mapping(uint256 => prev) prevdates;
     mapping(uint256 => patient) patientlist;
    
     struct patient{
     uint256 patient_id;
     }
     patient p; 
      struct prev{
          uint256 patient_id;
          string previous;
      }
      prev pr;
     
     struct tests{
     uint256 patient_id;    
     string blood_test;
     string urine_test;
     string ecg;
     string mri_scan;
     string ct_scan;
     string xray;
     string lab_test;
}
tests t;
struct scan{
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
scan s;
struct system{
    uint256 patient_id;
     string cns;
     string cvs;
     string rs;
     string abdomen;
}
system sys;
