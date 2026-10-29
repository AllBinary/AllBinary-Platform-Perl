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

#ActualPlatform
package org::allbinary::time::TimeStampUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::time::TimeStampUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::time::TimeStampUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getAsString {
    my ($self) = @_;
        my $simpleDataFormat = 'com::google::gwt::i18n::client::DateTimeFormat'->getFormat("yyyy-MM-dd HH:mm:ss.SSS");
        my $date = 'java::util::Date'->new();
        return $simpleDataFormat->format($date);
}

use com::google::gwt::i18n::client::DateTimeFormat;
use java::util::Date;

1;

