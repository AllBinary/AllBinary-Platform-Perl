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

package dynamic::NativeLibraryHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{library} = undef;
}


sub new {
    my ($class, $library) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{library} = $library;
    return $self;
}


sub load {
    my ($self) = @_;
        'java::lang::System'->loadLibrary($self->{library});
}

use java::lang::System;

1;

