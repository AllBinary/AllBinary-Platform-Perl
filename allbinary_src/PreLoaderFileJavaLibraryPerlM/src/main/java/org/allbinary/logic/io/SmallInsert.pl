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

package org::allbinary::logic::io::SmallInsert;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{fileName} = undef;
    $self->{string} = undef;
}


sub new {
    my ($class, $fileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{fileName} = $fileName;
        $self->{string} = 'org::allbinary::logic::io::file::AbFileSystem'->getInstance()->readAsString($fileName);
    return $self;
}


sub atBeginning {
    my ($self, $text) = @_;
        try {
            my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
            my $idOutData = 'java::io::DataOutputStream'->new($idFile);
            $idOutData->writeBytes($text . $self->{string});
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insertAtBeginning", $e);
            }
            return 0;
        }
}


sub after {
    my ($self, $text, $after) = @_;
        try {
            my $index = index($self->{string}, $after);
            if ($index < 0) {
                print("No such start: " . $after . " in: " . $self->{string}, "\n");
                return 0;
            }
            $index = $index + length($after);
            my $start = substr($self->{string}, 0, ($index) - (0));
            my $end = substr($self->{string}, $index + 1, (length($self->{string})) - ($index + 1));
            my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
            my $idOutData = 'java::io::DataOutputStream'->new($idFile);
            $idOutData->writeBytes($start . $text . $end);
            $idOutData->close();
            $idFile->close();
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "after", $e);
            }
            return 0;
        }
}


sub atEnd {
    my ($self, $text) = @_;
        try {
            my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
            my $idOutData = 'java::io::DataOutputStream'->new($idFile);
            $idOutData->writeBytes($self->{string} . $text);
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insertAtEnd", $e);
            }
            return 0;
        }
}

# use java::io::DataOutputStream;
# use java::io::FileOutputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFileSystem;
use org::allbinary::string::CommonStrings;
use java::lang::System;

1;

