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

#NoPlatform
package org::allbinary::logic::communication::log::LogFormatUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::LogFormatUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogFormatUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub get {
    my ($self, $className, $functionName, $specialMessage, $exception) = @_;
        die ("RuntimeException");
}


sub getS {
    my ($self, $className, $functionName, $specialMessage) = @_;
        die ("RuntimeException");
}


sub getO {
    my ($self, $exception) = @_;
        die ("RuntimeException");
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::java::exception::ExceptionUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::time::TimeStampUtil;

1;

