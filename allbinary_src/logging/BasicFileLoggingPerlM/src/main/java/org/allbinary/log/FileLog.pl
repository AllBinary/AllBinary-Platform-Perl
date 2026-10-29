#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::log::FileLog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
our $logLength = 33000000;
our $logPath = "g:\\log\\";
our $extension = ("" . "dat");
our $fileName = ("" . "log." . $org::allbinary::log::FileLog::extension);
our $backupFileName = $org::allbinary::log::FileLog::fileName->concat(".bak");
our $ORG_ALLBINARY = "org.allbinary: ";
our $firstTime = 1;
our $logFile = 'java::io::File'->new($org::allbinary::log::FileLog::logPath, $org::allbinary::log::FileLog::fileName);
our $logFileBak = undef;
our $fileOut = undef;
our $backupIndex = 0;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub createLogFile {
    my ($class) = @_;
        try {
            $org::allbinary::log::FileLog::logFile = 'java::io::File'->new($logPath, $fileName);
            if (!$org::allbinary::log::FileLog::firstTime) {
                $org::allbinary::log::FileLog::fileOut = 'java::io::BufferedWriter'->new('java::io::FileWriter'->new($logFile));
            } else {
                $org::allbinary::log::FileLog::firstTime = 0;
                my $raFile = 'java::io::RandomAccessFile'->new($logFile, "rw");
                $raFile->seek($raFile->length());
                $org::allbinary::log::FileLog::fileOut = 'java::io::BufferedWriter'->new('java::io::FileWriter'->new($raFile->getFD()));
            }
            my $canWrite = $org::allbinary::log::FileLog::logFile->canWrite();
            return $canWrite;
        } catch ($e) {
            print("Error Creating Log: " . $e, "\n");
            return 0;
        }
}


sub createLogFileBackup {
    my ($class) = @_;
        try {
            my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
            $org::allbinary::log::FileLog::logFileBak = 'java::io::File'->new($logPath, $stringMaker->append($backupFileName)->append('org::allbinary::string::CommonSeps'->getInstance()->{PERIOD})->appendint($backupIndex)->toString());
            while ($org::allbinary::log::FileLog::logFileBak->isFile()) {
                $org::allbinary::log::FileLog::backupIndex++;
                $stringMaker->delete(0, $stringMaker->length());
                $org::allbinary::log::FileLog::logFileBak = 'java::io::File'->new($logPath, $stringMaker->append($backupFileName)->append('org::allbinary::string::CommonSeps'->getInstance()->{PERIOD})->appendint($backupIndex)->toString());
            }
            my $line = "";
            my $tmpOut = 'java::io::BufferedWriter'->new('java::io::FileWriter'->new($logFileBak));
            my $tmpIn = 'java::io::BufferedReader'->new('java::io::FileReader'->new($logFile));
            while (defined((($line = $tmpIn->readLine())))) {
                $tmpOut->write($line, 0, length($line));
                $tmpOut->newLine();
            }
            $tmpOut->flush();
            $tmpOut->close();
            $tmpIn->close();
            $org::allbinary::log::FileLog::logFile->delete();
            return 1;
        } catch ($e) {
            print("Error Creating Backup: " . $e, "\n");
            return 0;
        }
}


sub put {
    my ($class, $specialMessage, $anyType, $functionName) = @_;
        return 'org::allbinary::log::FileLog'->put($specialMessage, $anyType, $functionName, undef);
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($class, $specialMessage, $anyType, $functionName, $exception) = @_;
        try {
            if ($org::allbinary::log::FileLog::firstTime == 1) {
                'org::allbinary::log::FileLog'->createLogFileBackup();
                if (__PACKAGE__->createLogFile() == 0) {
                    return ("" . "Log File Creation Error");
                }
            }
            my $length = $org::allbinary::log::FileLog::logFile->length();
            if ($length > $org::allbinary::log::FileLog::logLength) {
                if (!(__PACKAGE__->createLogFileBackup()) || __PACKAGE__->createLogFile() == 0) {
                    return ("" . "Couldn't Create a Backup file");
                }
            }
            my $className = ("" . $stringUtil->{NULL_STRING});
            if (!defined($functionName)) {
                $functionName = ("" . $org::allbinary::log::FileLog::stringUtil->{NULL_STRING});
            }
            if (!defined($specialMessage)) {
                $specialMessage = ("" . $org::allbinary::log::FileLog::stringUtil->{NULL_STRING});
            }
            if (defined(ref($anyType))) {
                $className = ("" . ref($anyType));
            }
            my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
            $org::allbinary::log::FileLog::fileOut->write($message, 0, length($message));
            $org::allbinary::log::FileLog::fileOut->newLine();
            $org::allbinary::log::FileLog::fileOut->flush();
            return ("" . $org::allbinary::log::FileLog::ORG_ALLBINARY . $message);
        } catch ($e) {
            return ("" . "Error: " . $e);
        }
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($class, $specialMessage, $className, $functionName) = @_;
        return 'org::allbinary::log::FileLog'->put($specialMessage, $className, $functionName, undef);
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($class, $specialMessage, $className, $functionName, $exception) = @_;
        try {
            if ($org::allbinary::log::FileLog::firstTime == 1) {
                'org::allbinary::log::FileLog'->createLogFileBackup();
                if (__PACKAGE__->createLogFile() == 0) {
                    return ("" . "Log File Creation Error");
                }
            }
            my $length = $org::allbinary::log::FileLog::logFile->length();
            if ($length > $org::allbinary::log::FileLog::logLength) {
                if (!(__PACKAGE__->createLogFileBackup()) || __PACKAGE__->createLogFile() == 0) {
                    return ("" . "Couldn't Create a Backup file");
                }
            }
            if (!defined($functionName)) {
                $functionName = ("" . $org::allbinary::log::FileLog::stringUtil->{NULL_STRING});
            }
            if (!defined($specialMessage)) {
                $specialMessage = ("" . $org::allbinary::log::FileLog::stringUtil->{NULL_STRING});
            }
            my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
            $org::allbinary::log::FileLog::fileOut->write($message, 0, length($message));
            $org::allbinary::log::FileLog::fileOut->newLine();
            $org::allbinary::log::FileLog::fileOut->flush();
            return ("" . $org::allbinary::log::FileLog::ORG_ALLBINARY . $message);
        } catch ($e) {
            return ("" . "Error: " . $e);
        }
}


sub getFilePath {
    my ($class) = @_;
        return $org::allbinary::log::FileLog::logPath + $org::allbinary::log::FileLog::fileName;
}

# use java::io::BufferedReader;
# use java::io::BufferedWriter;
use java::io::File;
# use java::io::FileReader;
# use java::io::FileWriter;
# use java::io::RandomAccessFile;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::LogFormatUtil;
use org::allbinary::logic::string::StringMaker;
use java::lang::System;

1;

