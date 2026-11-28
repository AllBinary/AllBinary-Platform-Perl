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

package tags::admin::DateRangeOrderHistoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{status} = undef unless exists $self->{status};
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        # super(...) made $self above
    return $self;
}


sub setStatus {
    my ($self, $value) = @_;
        $self->{status} = $value;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Tag Start", $self, $self->{tagStrings}->{DO_START_TAG});
            }
            $self->setName("Range Order History View");
            $self->setObjectFile("views.admin.orderhistory.DateRangeOrderHistoryView");
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($org::allbinary::globals::GLOBALS2::VIEW) == 0) {
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return java::lang::Object::jstatic('tags::admin::DateRangeOrderHistoryTag', 'SKIP_BODY');
        }
}

use java::lang::Object ();
# use javax::servlet::jsp::JspTagException ();
use org::allbinary::logic::communication::http::request::AbResponseHandler ();
use org::allbinary::logic::communication::log::LogUtil ();
use tags::StoreValidationTransformTag ();
use org::allbinary::globals::GLOBALS2 ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

