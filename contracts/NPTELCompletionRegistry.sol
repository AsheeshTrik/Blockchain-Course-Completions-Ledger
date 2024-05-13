// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract NPTELCompletionRegistry {
    // Define a struct to represent a course completion
    struct CourseCompletion {
        address user;
        string courseName;
        string institution;
        uint256 completionDate;
    }

    // Array to store course completions
    CourseCompletion[] public completions;

    // Event emitted when a course completion is registered
    event CourseCompleted(address indexed user, string courseName, string institution, uint256 completionDate);

    // Function to register a course completion
    function registerCompletion(string memory _courseName, string memory _institution) public {
        completions.push(CourseCompletion({
            user: msg.sender,
            courseName: _courseName,
            institution: _institution,
            completionDate: block.timestamp
        }));

        emit CourseCompleted(msg.sender, _courseName, _institution, block.timestamp);
    }

    // Function to get the total number of course completions
    function getTotalCompletions() public view returns (uint256) {
        return completions.length;
    }

    // Function to get details of a course completion by index
    function getCompletion(uint256 _index) public view returns (address, string memory, string memory, uint256) {
        require(_index < completions.length, "Index out of bounds");
        CourseCompletion memory completion = completions[_index];
        return (completion.user, completion.courseName, completion.institution, completion.completionDate);
    }
}
