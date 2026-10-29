# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::logic::io::file::FileUtil2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileUtil2'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{streamUtil} = 'org::allbinary::logic::io::StreamUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileUtil2::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub loadFileAsList {
    my ($self, $file, $max, $byteArray1) = @_;
        my $inputStream = undef;
        try {
            $inputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD}, $e);
        }
        return 'org::allbinary::logic::io::file::SimpleFileUtil'->getInstance()->loadFileAsList($inputStream, $max, $byteArray1);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::io::file::SimpleFileUtil;

1;

