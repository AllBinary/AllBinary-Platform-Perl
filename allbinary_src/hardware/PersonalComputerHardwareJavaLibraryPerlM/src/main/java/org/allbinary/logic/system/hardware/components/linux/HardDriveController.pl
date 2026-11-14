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

package org::allbinary::logic::system::hardware::components::linux::HardDriveController;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface','org::allbinary::logic::system::hardware::components::interfaces::HardDriveControllerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{data} = undef;
}


sub new {
    my ($class, $data) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{data} = $data;
    return $self;
}


sub compareTo {
    my ($self, $componentInterface) = @_;
        return 1;
}


sub toString {
    my ($self) = @_;
        return $self->{data};
}

use java::lang::Object ();
use org::allbinary::logic::system::hardware::components::interfaces::HardDriveControllerInterface ();
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface ();

1;

