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

package org::allbinary::logic::io::file::zip::ZipFileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::zip::ZipFileUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::zip::ZipFileUtil::instance;
}


sub create {
    my ($self, $outFilename, $fileBasicArrayList) = @_;
        try {
            my $zipFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($outFilename);
            if ($zipFile->exists()) {
                $zipFile->delete();
            }
            $zipFile->createNewFile();
            my $outputStream = 'java::util::zip::ZipOutputStream'->new('org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($zipFile));
            my $streamUtil = 'org::allbinary::logic::io::StreamUtil'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $byteArray = [(0) x (16384)];
            my $fileInputStream = undef;
            my $size = $fileBasicArrayList->size();
            my $current = 0;
            for (my $i = 0; $i < $size; $i++) {
                my $file = $fileBasicArrayList->get($i);
                if ($file->isDirectory()) {
                } elsif ($file->isFile()) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->appendint($current);
                    $stringBuffer->append(" Creating Zip File Entry: ");
                    $stringBuffer->append($file->getPath());
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "create()");
                    try {
                        $fileInputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
                        $outputStream->putNextEntry('java::util::zip::ZipEntry'->new($file->getPath()));
                        $streamUtil->get($fileInputStream, $outputStream, $byteArray);
                        $outputStream->closeEntry();
                        $streamUtil->close($fileInputStream);
                    } catch ($e) {
                        $self->{logUtil}->putF("Skipping File (Probably Local): " . $file->getPath(), $self, "create()");
                    }
                }
                $current++;
            }
            $streamUtil->close($outputStream);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create", $e);
        }
}


# throws Exception
sub unzip {
    my ($self, $path, $zipFile, $fileName) = @_;
        my $buffer = [(0) x (16384)];
        my $inputStream = undef;
        try {
            $inputStream = 'java::util::zip::ZipInputStream'->new('org::allbinary::logic::io::AbFileInputStream'->new($zipFile));
            my $zipEntry = undef;
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $fileUtil = 'org::allbinary::logic::io::file::FileUtil'->getInstance();
            while (defined((($zipEntry = $inputStream->getNextEntry())))) {
                my $entryName = $zipEntry->getName();
                if ($zipEntry->isDirectory()) {
                } else {
                    my $entryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($path . $entryName);
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("ZipEntry Name: ");
                    $stringBuffer->append($entryName);
                    $stringBuffer->append(" isFile: ");
                    $stringBuffer->appendboolean($entryFile->isFile());
                    $stringBuffer->append(" isDirectory: ");
                    $stringBuffer->appendboolean($entryFile->isDirectory());
                    $stringBuffer->append(" getParent: ");
                    $stringBuffer->append($entryFile->getParent());
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "unzip");
                    my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($entryFile);
                    $fileUtil->write($inputStream, $dataOutputStream, $buffer);
                }
                $inputStream->closeEntry();
            }
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($inputStream);
        }
}

# use java::util::zip::ZipEntry;
# use java::util::zip::ZipInputStream;
# use java::util::zip::ZipOutputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

