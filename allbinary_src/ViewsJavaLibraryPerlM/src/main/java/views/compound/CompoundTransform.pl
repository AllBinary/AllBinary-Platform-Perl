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

package views::compound::CompoundTransform;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::AbTransformer';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->setURIResolver('org::allbinary::data::tree::dom::StoreUriResolver'->new($self->getTransformInfoInterface(), $self->getURIResolver()));
        my $objectConfig = 'views::compound::objectConfig::CompoundContextTransformInfoObjectConfig'->new($self->{abeClientInformation}, $self->getTransformInfoInterface(), $self->getTransformInfoInterface()->getObjectConfigInterface()->toXmlDoc());
        if ($views::compound::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::compound::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("\nObjectConfig: \n" . $objectConfig->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        my $templateInputStream = $objectConfig->createInputStream();
        $self->setInputStream($templateInputStream);
    return $self;
}

# use java::io::InputStream;
# use javax::xml::transform::URIResolver;
use org::allbinary::data::tree::dom::BasicUriResolver;
use org::allbinary::data::tree::dom::StoreUriResolver;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::AbTransformer;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::compound::objectConfig::CompoundContextTransformInfoObjectConfig;

1;

