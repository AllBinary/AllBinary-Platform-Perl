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

package tags::admin::payment::gateways::ViewUnusedTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::admin::payment::gateways::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    $self->setName("Validation User View");
                    $self->setObjectFile("views.admin.payment.gateways.SelectNewValidationView");
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use tags::StoreValidationTransformTag;

1;

