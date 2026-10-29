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

package tags::admin::UserNameOrderHistoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{status} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
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
            $self->setName("Range Order History View");
            $self->setObjectFile("views.admin.orderhistory.UserNameOrderHistoryView");
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::admin::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
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

