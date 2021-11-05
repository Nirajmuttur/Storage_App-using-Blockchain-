pragma solidity ^0.5.0;

contract DStorage {
  // Name
  string public name = 'DStorage';

  // Number of files
  uint public filesCount = 0;

  // Mapping fileId=>Struct 
  mapping(uint =>File) public files;

  // Struct
  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileName;
    string fileType;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }


  // Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileName,
    string fileType,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  // Upload File function
  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileName, string memory _fileType, string memory _fileDescription) public {
    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);

    // Make sure file type exists
    require(bytes(_fileType).length > 0);

    // Make sure file description exists
    require(bytes(_fileDescription).length > 0);

    // Make sure file fileName exists
    require(bytes(_fileName).length > 0);

    // Make sure uploader address exists
    require(msg.sender != address(0));

    // Make sure file size is more than 0
    require(_fileSize > 0);

    // Increment file id

    // Add File to the contract
    
    filesCount ++;
    files[filesCount]= File(filesCount, _fileHash, _fileSize, _fileName, _fileType, _fileDescription, now, msg.sender);
    

    // Trigger an event
    emit FileUploaded(filesCount, _fileHash, _fileSize, _fileName, _fileType, _fileDescription, now, msg.sender);
  }

    

}