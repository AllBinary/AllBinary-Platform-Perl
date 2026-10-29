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

package views::admin::storefront::StoreFrontComponent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{newStoreFrontInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{newStoreFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFront'->new($self->getPageContext()->getRequest());
        if (!defined($self->{newStoreFrontInterface}->getName())) {
            $self->{newStoreFrontInterface}->setName($self->getWeblisketSession()->getStoreName());
        }
    return $self;
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view", $e);
            }
            die $e;
        }
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

