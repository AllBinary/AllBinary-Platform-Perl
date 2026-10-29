# 
# AllBinary Open License Version 1 
# Copyright (c) 2007 AllBinary 
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

package org::allbinary::logic::util::cache::CacheType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{vendor} = undef;
    $self->{type} = undef;
}


sub new {
    my ($class, $vendor, $type) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{vendor} = $vendor;
        $self->{type} = $type;
    return $self;
}


sub getVendor {
    my ($self) = @_;
        return $self->{vendor};
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("CacheType: Vendor: ");
        $stringBuffer->append($self->getVendor());
        $stringBuffer->append(" Type: ");
        $stringBuffer->append($self->getType());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

