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

package tags::StoreValidationTransformTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::ValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{storeName} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Tag Start", $self, $self->{tagStrings}->{DO_START_TAG});
            }
            return $self->SUPER::doStartTag();
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use tags::ValidationTransformTag;

1;

