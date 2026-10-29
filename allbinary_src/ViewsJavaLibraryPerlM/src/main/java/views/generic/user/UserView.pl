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

package views::generic::user::UserView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{user} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface('org::allbinary::business::user::UserDomNode'->new($self->{user}));
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::business::user::UserDomNode;
use org::allbinary::business::user::UserInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

