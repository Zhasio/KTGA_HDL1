 
 Const ForReading = 1
 Const ForWriting = 2


Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder("D:\Github\KTGA_HDL\KTG FBL\WorkRelationship")
Set colFiles = objFolder.Files
For Each objFile in colFiles
	Set objFiles = objFSO.OpenTextFile("D:\Github\KTGA_HDL\KTG FBL\WorkRelationship\" & objFile.Name, ForReading)

	strText = objFiles.ReadAll
	objFiles.Close
	strNewText = Replace(strText, "|", "	")

	Set objFiles = objFSO.OpenTextFile("D:\Github\KTGA_HDL\KTG FBL\WorkRelationship\" & objFile.Name, ForWriting)
	objFiles.WriteLine strNewText
	objFiles.Close
Next