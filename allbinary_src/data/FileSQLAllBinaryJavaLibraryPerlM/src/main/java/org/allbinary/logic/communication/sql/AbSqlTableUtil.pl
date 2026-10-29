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

package org::allbinary::logic::communication::sql::AbSqlTableUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{EXTENSION} = ".adb";
    $self->{END} = "')\n";
    $self->{SAVING_BACKUP_PATH} = "Saving Backup: Path: ";
    $self->{FILE_LABEL} = " File: ";
    $self->{METHOD_RESTORE_TABLE} = "restoreTable()";
    $self->{METHOD_BACKUP_TABLE} = "backupTable()";
    $self->{METHOD_BACKUP_FILE} = "backupFile()";
    $self->{METHOD_GET_OUTPUT_STREAM} = "getOutputStream()";
    $self->{TABLE_CREATION_SUCCESS} = "Table Creation Successful: ";
    $self->{DROPPED_SUCCESS} = " Dropped Successfully";
    $self->{SAVING} = "Saving: ";
    $self->{APPENDING} = "Appending: ";
    $self->{TABLE_LABEL} = "Table: ";
    $self->{BACKUP_SUCCESS} = " Backup Success";
    $self->{ERROR_CREATING} = "Error Creating: ";
    $self->{TOTAL_LABEL} = " Total: ";
    $self->{SECTION_LABEL} = " Section: ";
    $self->{DASH} = " - ";
    $self->{PORTION_RESTORED} = " Portion Restored";
    $self->{specialCharArray} = ["\n", "\f", "\r"];
    $self->{NEW_LINE} = "\\n";
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{sqlStrings} = 'org::allbinary::logic::communication::sql::SqlStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::sql::AbSqlTableUtil::instance;
}


sub getOutputStream {
    my ($self, $backupPath, $tableName) = @_;
        try {
            my $fileName = $tableName . $self->{EXTENSION};
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{SAVING} . $tableName, $self, $self->{METHOD_GET_OUTPUT_STREAM});
            }
            my $backupFilePath = 'org::allbinary::logic::io::path::AbPath'->new($backupPath, $fileName);
            my $backupFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($backupFilePath);
            if ($backupFile->exists()) {
                $self->backupFile($backupFilePath, $backupPath, $tableName);
                $backupFile->delete();
            }
            $backupFile->createNewFile();
            my $outputStream = 'org::allbinary::logic::io::AbFileOutputStream'->new($backupFile);
            return $outputStream;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put("Create File", $self, $self->{METHOD_GET_OUTPUT_STREAM}, $e);
            }
            return undef;
        }
}


sub backupFile {
    my ($self, $path, $backupPath, $tableName) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $timeLong = $calendar->getTimeInMillis();
            my $time = ("" . ($timeLong));
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $fileName = $tableName . $self->{EXTENSION};
            $stringBuffer->append($backupPath);
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
            $stringBuffer->append($time);
            my $backupAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString());
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{SAVING_BACKUP_PATH});
                $stringBuffer->append($backupAbPath->toFileSystemString());
                $stringBuffer->append($self->{FILE_LABEL});
                $stringBuffer->append($fileName);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_BACKUP_FILE});
            }
            'org::allbinary::logic::io::file::directory::Directory'->create($backupAbPath);
            my $backupFileBak = 'org::allbinary::logic::io::file::AbFile'->createAbFile($backupAbPath->toFileSystemString());
            $backupFileBak->createNewFile();
            'org::allbinary::logic::io::file::FileUtil'->getInstance()->copy($path, $backupAbPath);
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{METHOD_BACKUP_FILE}, $e);
            }
            return 0;
        }
}


sub convertNewLines {
    my ($self, $value) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $index = 0;
        my $lastIndex = 0;
        while ($index < length($value)) {
            $index = index($value, $self->{specialCharArray}->[0], $lastIndex);
            if ($index != -1) {
                my $nextLine = substr($value, $lastIndex, ($index - 1) - ($lastIndex));
                $stringBuffer->append($nextLine);
                $stringBuffer->append($self->{NEW_LINE});
                $lastIndex = $index + 1;
            } else {
                last;
            }
        }
        if ($lastIndex < length($value)) {
            $stringBuffer->append(substr($value, $lastIndex, (length($value)) - ($lastIndex)));
        }
        return $stringBuffer->toString();
}


sub backupTable {
    my ($self, $abSqlTable) = @_;
        my $tableName = $abSqlTable->getTableName();
        try {
            my $count = 0;
            my $sqlStatement = $self->{sqlStrings}->{SELECT_ALL_FROM} . $tableName;
            my $path = $org::allbinary::logic::communication::sql::org::allbinary->{globals}->{URLGLOBALS}->getMainPath() + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH};
            if (!'org::allbinary::logic::io::file::directory::Directory'->create('org::allbinary::logic::io::path::AbPath'->new($path))) {
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{ERROR_CREATING} . $path, $self, $self->{METHOD_BACKUP_TABLE});
                }
            }
            my $rset = $abSqlTable->executeSQLStatement($sqlStatement);
            my $rsmd = $rset->getMetaData();
            my $colNum = $rsmd->getColumnCount();
            my $QUERY_START = ""->append($self->{sqlStrings}->{INSERT_INTO})->append($tableName)->append($self->{sqlStrings}->{VALUES})->toString();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $outputStream = $self->getOutputStream($path, $tableName);
            while ($rset->next()) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($QUERY_START);
                for (my $i = 1; $i < $colNum; $i++) {
                    my $value = $rset->getString($i);
                    $stringBuffer->append($self->convertNewLines($value));
                    $stringBuffer->append($self->{sqlStrings}->{SINGLE_QUOTE_COMMA_SEP});
                }
                $stringBuffer->append($rset->getString($colNum));
                $stringBuffer->append($self->{END});
                my $sqlStatementLine = $stringBuffer->toString();
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF($self->{APPENDING} . $sqlStatementLine, $self, $self->{METHOD_BACKUP_TABLE});
                }
                $outputStream->write([unpack("C*", $sqlStatementLine)]);
            }
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($outputStream);
            return $self->{TABLE_LABEL} . $tableName . $self->{BACKUP_SUCCESS};
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put("Backup Table Failed\nSQL Statement", $self, $self->{METHOD_BACKUP_TABLE}, $e);
            }
            return $self->{TABLE_LABEL} . $tableName . " Backup Failed";
        }
}


sub restoreTable {
    my ($self, $abSqlTable, $portion) = @_;
        my $tableName = $abSqlTable->getTableName();
        try {
            my $path = $org::allbinary::logic::communication::sql::org::allbinary->{globals}->{URLGLOBALS}->getMainPath() + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH};
            my $current = int($portion->getCurrent());
            if ($current == 0) {
                if ('org::allbinary::logic::io::file::directory::Directory'->create('org::allbinary::logic::io::path::AbPath'->new($path))) {
                    if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                        $self->{logUtil}->putF($self->{ERROR_CREATING} . $path, $self, $self->{METHOD_RESTORE_TABLE});
                    }
                }
            }
            my $backupFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($path, $tableName . $self->{EXTENSION});
            my $bufferedLineReader = 'org::allbinary::logic::io::BufferedLineReader'->new($backupFile);
            my $size = $bufferedLineReader->getSize();
            my $section = $size / int($portion->getTotal()) + 1;
            my $start = $section * $current;
            my $end = $start + $section;
            if ($end > $size) {
                $end = $size;
            }
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{TOTAL_LABEL});
            $stringBuffer->append($size);
            $stringBuffer->append($self->{SECTION_LABEL});
            $stringBuffer->append($start);
            $stringBuffer->append($self->{DASH});
            $stringBuffer->append($end);
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_RESTORE_TABLE});
            }
            $bufferedLineReader->readUpToLines($start);
            my $line = $self->{stringUtil}->{EMPTY_STRING};
            while ($bufferedLineReader->getCurrent() < $end && defined((($line = $bufferedLineReader->readLine())))) {
                if (length($line) > 1) {
                    $abSqlTable->executeSQLStatement($line);
                }
            }
            $stringBuffer->append($self->{commonSeps}->{SPACE});
            $stringBuffer->append($self->{TABLE_LABEL});
            $stringBuffer->append($tableName);
            $stringBuffer->append($self->{PORTION_RESTORED});
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put("Restore Table Failed\nSQL Statement", $self, $self->{METHOD_RESTORE_TABLE}, $e);
            }
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{TABLE_LABEL});
            $stringBuffer->append($tableName);
            $stringBuffer->append(" Restoration Failed");
            return $stringBuffer->toString();
        }
}

use org::allbinary::logic::string::StringMaker;
# use java::sql::ResultSet;
# use java::sql::ResultSetMetaData;
use java::util::Calendar;
use org::allbinary::business::installer::Portion;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::BufferedLineReader;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::globals::PATH_GLOBALS;
# use java::io::OutputStream;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::sql::SqlStrings;

1;

