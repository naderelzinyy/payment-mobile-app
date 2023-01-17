<?php

namespace App\Admin\Controllers;

use App\Models\Users;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Users';
//
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Users());

        $grid -> column('id', 'ID');
        $grid -> column('first_name', 'First Name');
        $grid -> column('last_name', 'Last Name');
        $grid -> column('email', 'Email');
        $grid -> column('password', 'Password');
        $grid -> column('created_at', 'Created At');
        $grid -> column('updated_at', 'Updated At');

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Users::findOrFail($id));



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Users());



        return $form;
    }
}
