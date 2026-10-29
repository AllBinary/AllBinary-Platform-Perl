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

package org::allbinary::logic::io::CloudStreamUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::CloudStreamUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::CloudStreamUtil::instance;
}


# throws Exception
sub getFile {
    my ($self, $file) = @_;
        my $inputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
        my $available = $inputStream->available();
        if ($available > 0) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Cloud File Bytes: " . $available, $self, "processRequest()");
            }
        }
        return $inputStream;
}


# throws Exception
sub getFileAnyWhere {
    my ($self, $file) = @_;
        my $inputStream = 'org::allbinary::logic::io::AbFileLocalInputStream'->new($file);
        my $available = $inputStream->available();
        if ($available > 0) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Local File Bytes: " . $available, $self, "processRequest()");
            }
        } else {
            $inputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
            $available = $inputStream->available();
            if ($available > 0) {
                if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                    $self->{logUtil}->putF("Cloud File Bytes: " . $available, $self, "processRequest()");
                }
            }
        }
        return $inputStream;
}


# throws Exception
sub getFileLocal {
    my ($self, $file) = @_;
        my $inputStream = 'org::allbinary::logic::io::AbFileLocalInputStream'->new($file);
        my $available = $inputStream->available();
        if ($available > 0) {
            if ($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::io::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Local File Bytes: " . $available, $self, "processRequest()");
            }
        }
        return $inputStream;
}

# use java::io::InputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileLocalInputStream;

1;

