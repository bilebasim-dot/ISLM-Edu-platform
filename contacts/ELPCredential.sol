// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ELPCredential {
    struct Credential {
        address student;
        string courseName;
        uint256 issueDate;
        bool isVerified;
    }
    
    mapping(address => Credential[]) public studentCredentials;
    
    event CredentialIssued(address student, string courseName);
    
    function issueCredential(address student, string memory courseName) public {
        Credential memory newCredential = Credential({
            student: student,
            courseName: courseName,
            issueDate: block.timestamp,
            isVerified: true
        });
        
        studentCredentials[student].push(newCredential);
        emit CredentialIssued(student, courseName);
    }
    
    function getStudentCredentials(address student) public view returns (Credential[] memory) {
        return studentCredentials[student];
    }
}