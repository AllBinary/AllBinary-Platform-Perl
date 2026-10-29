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

package tags::HelperTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::PropertiesTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tagHelperFactoryInterface} = undef;
    $self->{anyType} = undef;
}


sub new {
    my ($class, $tagHelperFactoryInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->{tagHelperFactoryInterface} = $tagHelperFactoryInterface;
    return $self;
}


# throws Exception
sub setHelper {
    my ($self) = @_;
        if (!defined($self->{anyType})) {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Creating TagHelper with: \n" . $self->getPropertiesHashMap()->toString(), $self, "doStartTag");
            }
            $self->{anyType} = $self->{tagHelperFactoryInterface}->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
        }
}


sub getHelper {
    my ($self) = @_;
        return $self->{anyType};
}


sub doEndTag {
    my ($self) = @_;
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF("Tag Ended", $self, "doEndTag");
        }
        $self->{anyType} = undef;
        return $self->SUPER::doEndTag();
}

use admin::taghelpers::TagHelperFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use tags::PropertiesTag;

1;

