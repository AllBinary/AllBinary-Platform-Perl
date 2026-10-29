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

package admin::tags::AdminConfigurationTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->setTagHelperFactory('admin::taghelpers::AdminConfigurationHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::AdminConfigurationRequestHelperFactory'->new());
    return $self;
}

use admin::taghelpers::AdminConfigurationHelperFactory;
use admin::taghelpers::AdminConfigurationRequestHelperFactory;
use admin::tags::TableTag;

1;

