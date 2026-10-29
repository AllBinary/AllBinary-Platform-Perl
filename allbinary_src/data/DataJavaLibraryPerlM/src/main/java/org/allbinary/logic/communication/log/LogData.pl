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

package org::allbinary::logic::communication::log::LogData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{MAX} = 5000000;
    $self->{extension} = "log";
    $self->{backupFileExt} = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . "bak" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . "txt";
    $self->{ALLBINARY} = "allbinary";
    $self->{NAME} = "LOG_NAME";
    $self->{DESCRIPTION} = "LOG_DESCRIPTION";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::logic::io::path::AbPathData;

1;

