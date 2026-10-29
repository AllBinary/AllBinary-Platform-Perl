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

package org::allbinary::data::generator::UniqueIdGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::generator::IdGeneratorInterface';

our $EXT = ".unq";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{newFile} = undef;
    $self->{id} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub initialize {
    my ($self, $value) = @_;
        try {
            $self->{newFile}->createNewFile();
            my $idData = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($self->{newFile});
            $idData->writeLong($value);
        } catch ($e) {
            if ($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "initialize", $e);
            }
        }
}


# throws Exception
sub setFile {
    my ($self, $filePathName, $name) = @_;
        $self->{newFile} = 'org::allbinary::logic::io::file::AbFile'->createAbFile($filePathName);
}


# throws IOException
sub getNext {
    my ($self) = @_;
        my $idData = undef;
        my $idOutData = undef;
        try {
            my $idFile = 'org::allbinary::logic::io::AbFileInputStream'->new($self->{newFile});
            $idData = 'org::allbinary::logic::io::AbDataInputStream'->new($idFile);
            $self->{id} = $idData->readLong();
            my $idOutFile = 'org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($self->{newFile});
            $idOutData = 'org::allbinary::logic::io::AbDataOutputStream'->new($idOutFile);
            $idOutData->writeLong($self->{id} + 1);
            my $idLong = $self->{id};
            return ("" . ($idLong));
        } catch ($e) {
            if ($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getNext", $e);
            }
            return "Error";
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($idData);
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($idOutData);
        }
}

# use java::io::IOException;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbDataInputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::string::CommonStrings;
use org::allbinary::data::generator::IdGeneratorInterface;

1;

