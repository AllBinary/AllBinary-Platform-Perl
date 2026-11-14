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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{transformInfoInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->{transformInfoInterface} = $transformInfoInterface;
    return $self;
}


# throws Exception
sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


sub getWeblisketSession {
    my ($self) = @_;
        return 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($self->getPropertiesHashMap(), $self->getPageContext());
}


sub getPageContext {
    my ($self) = @_;
        return $self->{transformInfoInterface}->getPageContext();
}


sub getPropertiesHashMap {
    my ($self) = @_;
        return $self->{transformInfoInterface}->getPropertiesHashMap();
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::communication::http::request::session::WeblisketSession ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();

1;

