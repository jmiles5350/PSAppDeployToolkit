# Start-Transcript Examples

.PARAMETER: Description
	-Path:						Location of the transcript (log) file
	-Append:					Append content to an existing file
	-Force:						Overwrite files with Read-only flag
	-NoClobber:					Prevent overwriting of existing files
	-IncludeInvocationHeader:	Add the timestamp to a command in the log file
	-UseMinimalHeader:			Prepend a short header instead of the full header (PS6+)
	-OutputDirectory:			Specify the output directory (filename will be created automatically)

	----------------------------------------------

.EXAMPLES:
	Start-Transcript -OutputDirectory c:\temp\Logfiles -UseMinimalHeader

	# Your script here

	Stop-Transcript

<# // SEE NOTES - Start-Transcript Params
    # Append the transcript to a mfastatus-result.log file.
    Start-Transcript -Path c:\logfiles\mfastatus-result.log -Append

    # Or use -NoClobber to prevent overwriting of existing files
    Start-Transcript -Path c:\logfiles\mfastatus-result.log -NoClobber
#>
