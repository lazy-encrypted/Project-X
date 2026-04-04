.method public isSecureLocked()Z
    .registers 3

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x2000

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    return v1

    :cond_a
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isScreenCaptureDisabledByMdm()Z

    move-result v0

    if-eqz v0, :cond_11

    return v1

    :cond_11
    invoke-static {}, Landroid/app/admin/DevicePolicyCache;->getInstance()Landroid/app/admin/DevicePolicyCache;

    move-result-object v0

    if-nez v0, :cond_19

    const/4 p0, 0x0

    return p0

    :cond_19
    invoke-static {}, Landroid/app/admin/DevicePolicyCache;->getInstance()Landroid/app/admin/DevicePolicyCache;

    move-result-object v0

    iget p0, p0, Lcom/android/server/wm/WindowState;->mShowUserId:I

    invoke-virtual {v0, p0}, Landroid/app/admin/DevicePolicyCache;->isScreenCaptureAllowed(I)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0
.end method

.method public isSelfAnimating(II)Z
