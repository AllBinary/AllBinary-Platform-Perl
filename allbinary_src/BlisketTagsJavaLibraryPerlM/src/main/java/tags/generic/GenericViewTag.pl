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

package tags::generic::GenericViewTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::TransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{output} = undef;
    $self->{file} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($tags::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub setOutput {
    my ($self, $value) = @_;
        $self->{output} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{NAME}, $self->{output});
}


sub setFile {
    my ($self, $value) = @_;
        $self->{file} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{FILE}, $self->{file});
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::InputOutputTypeData;
use tags::TransformTag;

1;

