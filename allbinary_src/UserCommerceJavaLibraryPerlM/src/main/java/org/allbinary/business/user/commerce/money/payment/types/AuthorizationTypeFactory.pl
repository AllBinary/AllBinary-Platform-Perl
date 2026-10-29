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

package org::allbinary::business::user::commerce::money::payment::types::AuthorizationTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("None");
    $self->{VOICE} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("Voice");
    $self->{RETINAL} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("Retinal");
    $self->{IMAGE} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("Image");
    $self->{DNA} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("DNA");
    $self->{PRINT} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("Print");
    $self->{CHIP} = 'org::allbinary::business::user::commerce::money::payment::types::AuthorizationType'->new("Chip");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::types::AuthorizationTypeFactory::instance;
}

use org::allbinary::business::user::commerce::money::payment::types::AuthorizationType;

1;

