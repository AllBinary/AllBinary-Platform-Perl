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

package org::allbinary::logic::visual::transform::TransformInfoCustomUriTransformer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::BasicTransformer';



sub new {
    my ($class, $abeClientInformation, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface);
        # super(...) made $self above
        my $transformInfoObjectConfigInterface = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface);
        $self->setURIResolver('org::allbinary::data::tree::dom::CustomUriResolver'->new($transformInfoObjectConfigInterface->getImportUriPath(), $self->getURIResolver()));
    return $self;
}

# use javax::xml::transform::URIResolver;
use org::allbinary::data::tree::dom::BasicUriResolver;
use org::allbinary::data::tree::dom::CustomUriResolver;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::BasicTransformer;

1;

