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

package org::allbinary::logic::io::SmallDelete;
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


sub deleteAtStart {
    my ($self, $start, $end) = @_;
        try {
            my $beginIndex = 0;
            my $endIndex = 0;
            $beginIndex = index($self->{string}, $start);
            $endIndex = index($self->{string}, $end);
            if ($endIndex > $beginIndex && $beginIndex >= 0 && $endIndex >= 0 && $beginIndex < 10 && $endIndex < 525) {
                my $text = substr($self->{string}, $endIndex, (length($self->{string})) - ($endIndex));
                my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
                my $idOutData = 'java::io::DataOutputStream'->new($idFile);
                $idOutData->writeBytes($text);
                return 1;
            }
            return 0;
        } catch ($e) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "deleteAtStart", $e);
            }
            return 0;
        }
}


sub deleteBetween {
    my ($self, $start, $end, $newText) = @_;
        try {
            my $beginIndex = 0;
            my $endIndex = 0;
            $beginIndex = index($self->{string}, $start);
            $endIndex = index($self->{string}, $end);
            if ($endIndex > $beginIndex && $beginIndex >= 0 && $endIndex >= 0 && $beginIndex < 50 && $endIndex < 425) {
                my $newStart = substr($self->{string}, 0, ($beginIndex) - (0));
                my $text = substr($self->{string}, $endIndex + length($end), (length($self->{string})) - ($endIndex + length($end)));
                my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
                my $idOutData = 'java::io::DataOutputStream'->new($idFile);
                $idOutData->writeBytes($newStart . $newText . $text);
                return 1;
            }
            return 0;
        } catch ($e) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "deleteAtStart", $e);
            }
            return 0;
        }
}

# use java::io::DataOutputStream;
# use java::io::FileOutputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFileSystem;
use org::allbinary::string::CommonStrings;

1;

