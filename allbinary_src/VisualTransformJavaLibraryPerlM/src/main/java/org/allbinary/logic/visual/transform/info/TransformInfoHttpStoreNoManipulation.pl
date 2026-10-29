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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreNoManipulation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoHttpStore';



sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub setObjectConfigFile {
    my ($self, $value) = @_;
        $self->setObjectConfigFileName($value);
        $self->setObjectConfigInterface('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory'->getInstance()->getInstance($self, $self->getObjectConfigFilePath()));
}


# throws Exception
sub setObjectConfig {
    my ($self, $value) = @_;
        die ("Should not set from config");
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStore;

1;

