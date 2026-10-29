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

package org::allbinary::logic::io::BufferedWriterUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::BufferedWriterUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonLabels} = 'org::allbinary::string::CommonLabels'->getInstance();
    $self->{REMOVING_OLD} = "Remove old for overwriting: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::BufferedWriterUtil::instance;
}


# throws Exception
sub overwrite {
    my ($self, $path, $data) = @_;
        my $abFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($path);
        if ($abFile->exists()) {
            $self->{logUtil}->putF($self->{REMOVING_OLD} . $path, $self, $self->{commonStrings}->{CREATE});
            $abFile->delete();
        } else {
            my $name = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->removeNameFromPath($path);
            my $abFileDirectory = 'org::allbinary::logic::io::file::AbFile'->createAbFile($name);
            if ($abFileDirectory->exists()) {
            } else {
                my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
                $self->{logUtil}->putF($stringBuilder->append($self->{commonStrings}->{CREATE})->append($self->{commonLabels}->{COLON_SEP})->append($name)->toString(), $self, $self->{commonStrings}->{CREATE});
                my $result = $abFileDirectory->mkdirs();
                $stringBuilder->delete(0, $stringBuilder->length());
                $self->{logUtil}->putF($stringBuilder->append($self->{commonLabels}->{RESULT_})->appendboolean($result)->toString(), $self, $self->{commonStrings}->{CREATE});
            }
        }
        $self->write($abFile, $data);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub overwrite {
    my ($self, $abFile, $data) = @_;
        if ($abFile->exists()) {
            $self->{logUtil}->putF($self->{REMOVING_OLD} . $abFile->getPath(), $self, $self->{commonStrings}->{CREATE});
            $abFile->delete();
        } else {
            my $name = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->removeNameFromPath($abFile->getAbsolutePath());
            my $abFileDirectory = 'org::allbinary::logic::io::file::AbFile'->createAbFile($name);
            if ($abFileDirectory->exists()) {
            } else {
                my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
                $self->{logUtil}->putF($stringBuilder->append($self->{commonStrings}->{CREATE})->append($self->{commonLabels}->{COLON_SEP})->append($name)->toString(), $self, $self->{commonStrings}->{CREATE});
                my $result = $abFileDirectory->mkdirs();
                $stringBuilder->delete(0, $stringBuilder->length());
                $self->{logUtil}->putF($stringBuilder->append($self->{commonLabels}->{RESULT_})->appendboolean($result)->toString(), $self, $self->{commonStrings}->{CREATE});
            }
        }
        $self->write($abFile, $data);
}


# throws Exception
sub write {
    my ($self, $abFile, $data) = @_;
        my $fileOut = 'java::io::BufferedWriter'->new('java::io::FileWriter'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($abFile)));
        $fileOut->write($data, 0, length($data));
        $fileOut->newLine();
        $fileOut->flush();
}

# use java::io::BufferedWriter;
# use java::io::FileWriter;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;

1;

