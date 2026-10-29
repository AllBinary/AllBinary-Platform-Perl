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

package org::allbinary::DisposalUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::DisposalUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::DisposalUtil::instance;
}


sub disposeImage {
    my ($self, $image) = @_;
        if (!defined($image)) {
            return;
        }
        if ($image->isMutable()) {
            my $mutableImage = $image;
            $self->disposeResource($mutableImage->getImage());
        } else {
        }
}


sub disposeResource {
    my ($self, $resource) = @_;
        if (!$resource->isDisposed()) {
            print($self->{commonStrings}->{CLOSE}, "\n");
            $resource->dispose();
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::string::CommonStrings;
use org::eclipse::swt::graphics::Resource;
use org::microemu::device::swt::SwtMutableImage;
use java::lang::System;

1;

