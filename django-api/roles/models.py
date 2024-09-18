import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    # NEW FOR THE ROLES
    class Types(models.TextChoices):
        ADMIN = "ADMIN", "Admin"
        OWNER = "OWNER", "Owner"
        EMPLOYEE = "EMPLOYEE", "Employee"
        CUSTOMER = "CUSTOMER", "Customer"

    type = models.CharField(
        max_length=20, choices=Types.choices, default=Types.ADMIN
    )

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email_address = models.EmailField(unique=True, max_length=50)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    updated_at = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    deleted_at = models.DateTimeField(default=None, blank=True, null=True)

    USERNAME_FIELD = "email_address"
    REQUIRED_FIELDS = ["first_name", "last_name"]

    class Meta:
        db_table = 'users'

    def __str__(self):
        return self.email_address